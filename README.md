# CMake Project Template

Here's a template to create your C++ project from scratch using `CMake`.
You'll find an implementation of unit testing in it too.

## Helper scripts

To build and develop, you can use the helpers `build` and `dev`.
You should give them permissions to be executed:
```
chmod +x build.sh
chmod +x dev.sh
chmod +x test.sh
```

You can build the project using:
```bash
./build.sh
```

Ton run the project, use:
```bash
./dev.sh
```

You can rebuild it using the `rebuild` flag:
```bash
./dev.sh --rebuild
```
