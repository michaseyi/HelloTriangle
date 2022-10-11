CFLAGS = -std=c++17 -O2
LDFLAGS = -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi

HelloTriangle: main.cpp
	g++ $(CFLAGS) -o bin/HelloTriangle main.cpp $(LDFLAGS)

.PHONY: test clean shaders

shaders: shaders/compile.sh
	shaders/compile.sh

test: HelloTriangle shaders
	bin/HelloTriangle

clean:
	rm -f bin/HelloTriangle
