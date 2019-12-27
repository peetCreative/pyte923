from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

te923_extension = Extension("pyte923",
    ["pyte923.pyx"],
    libraries=["te923"],
    library_dirs=["te923"],
    include_dirs=["te923"],
    extra_link_args=["-lusb"]
)
setup(
    name="pyte923",
    ext_modules=cythonize([te923_extension]),
    description='python module for te923 weatherstation',
    author='Peter Klausing',
    url='https://github.com/peetCreative/pyte923',
    packages=['distutils', 'distutils.command'],
)
