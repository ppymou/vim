import importlib.util

from m_base import Base


class PipeRunner(Base):
    def __init__(self):
        super().__init__([
            'csv_util',
            'fs_util',
            'json_util',
            'librosa',
            'm_audio.audio_util',
            'tqdm',
        ], {
            'audio_util': 'm_audio.audio_util',
        })

    def run(self, script):
        '''Provide all the utilities available to in_'''
        spec = importlib.util.spec_from_file_location(script,
                                                      './%s.py' % script)
        mod = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(mod)

        worker = mod.Worker(self)
        return worker

    def ytpipe(self):
        from m_pipe.p_yt import Worker
        return Worker(self)