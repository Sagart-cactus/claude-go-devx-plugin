package main

import (
	"fmt"

	"example.com/claude-go-plugin-sample/internal/service"
)

func main() {
	fmt.Println(service.DescribeDelta(7, 3))
}
