package service

import (
	"fmt"

	"example.com/claude-go-plugin-sample/internal/mathx"
)

func DescribeDelta(a, b int) string {
	return fmt.Sprintf("delta(%d,%d)=%d", a, b, mathx.Sub(a, b))
}
