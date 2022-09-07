The Node [lessc](https://www.npmjs.com/package/less) compiler packaged into a single file executable. It uses [pkg](https://www.npmjs.com/package/pkg) to produce a single executable file.

## Why?

There's no need to have Node installed on the system to run this. The single `lessc` file contains Node 14 within, so you can just run it.

## Building

Install dependencies:

    npm ci

Package into an executable:

    npm run build

This will produce `bin/lessc`

Test it:

    # Check the version
    $ ./bin/lessc --version
    lessc 3.9.0 (Less Compiler) [JavaScript]

    # Test that it works
    $ ./bin/lessc tests/files/a.less
    p {
      color: white;
    }
    body {
      background: red;
    }

    # Really test that it works without having Node installed
    $ docker run -it -v ${PWD}:/root/less-compiler ubuntu:22.04
    root@c30648fcd7f4:/# which node
    root@c30648fcd7f4:/# which nodejs
    root@c30648fcd7f4:/# which npm
    root@c30648fcd7f4:/# node
    bash: node: command not found
    root@c30648fcd7f4:/# /root/less-compiler/bin/lessc /root/less-compiler/tests/files/a.less
    p {
      color: white;
    }
    body {
      background: red;
    }

## Use it

Take the produced file `bin/lessc` and use that wherever you need to run it.

## Releasing A New Version

- Modify the version of `less` desired either by editing `package.json` then running `npm install`, or by running `npm update less`  
- Create a personal access token on GitHub that has the "repo" permission from here: https://github.com/settings/tokens
- Add that token to your `~/.bash_profile`:
```
export GITHUB_TOKEN="gh_yourtokenehere"
```
- Run the command:
```
npm run release
```
This will create a new tag and release on GitHub with the version of `lessc` created.
