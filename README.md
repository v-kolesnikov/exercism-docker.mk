# Exercism docker.mk

## Usage

Add to your Makefile follow lines:

```makefile
EXERCISM_LANG := %language%
include %path to docker.mk%
```

Now you can make some exercism cli commands from docker:

- `fetch`: fetch next uncomplete exercixse for EXERCISM_LANG
- `status`: show your status on exercism.io by EXERCISM_LANG
- `submit EXERCISE=%path to exercise file%`: submit EXERCISE to exercism.io
