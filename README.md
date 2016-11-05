# Exercism docker.mk

## Usage

Add the following lines to your Makefile:

```makefile
EXERCISM_LANG := %language%
include %path to docker.mk%

test::
    %test_command%
```

Now you can run some exercism cli commands with Docker:

- `make fetch`: fetch next uncompleted exercise for EXERCISM_LANG
- `make status`: show your status on exercism.io by EXERCISM_LANG
- `make submit EXERCISE=%path to exercise file%`: submit EXERCISE to exercism.io

Run `make test` for run your %test_command% from docker.

See example usage in:

 - [exercism-elixir](https://github.com/v-kolesnikov/exercism-elixir/blob/master/Makefile)
 - [exercism-es6](https://github.com/v-kolesnikov/exercism-es6/blob/master/Makefile)
 - [exercism-ruby](https://github.com/v-kolesnikov/exercism-ruby/blob/master/Makefile)
