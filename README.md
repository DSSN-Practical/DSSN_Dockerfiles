### Docker images (or image templates) for a DSSN simulation platform

#### Debian-based Docker images

virtuoso - VOS with default settings (non Lite-mode, memory consumption around 250 MiB)

virtuoso_configurable - VOS that injects the virtuoso configuration from the context into the image (allows for switch to light mode and control of consumed memory for disk caching)

xodx - components for an xodx node (except for VOS): nginx, php-fpm, Erfurt, xodx itself, client components for VOS


* also in here: `fig.yml` for testing usage for orchestration of several xodx instances with isolated dockerized VOS servers (also in k:1 relationship)
