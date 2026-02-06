package mathx

import "testing"

func TestSub(t *testing.T) {
	tests := []struct {
		name string
		a    int
		b    int
		want int
	}{
		{name: "positive", a: 7, b: 3, want: 4},
		{name: "negative result", a: 2, b: 5, want: -3},
	}

	for _, tc := range tests {
		t.Run(tc.name, func(t *testing.T) {
			got := Sub(tc.a, tc.b)
			if got != tc.want {
				t.Fatalf("Sub(%d, %d)=%d want=%d", tc.a, tc.b, got, tc.want)
			}
		})
	}
}
