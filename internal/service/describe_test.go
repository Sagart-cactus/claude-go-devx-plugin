package service

import "testing"

func TestDescribeDelta(t *testing.T) {
	got := DescribeDelta(5, 2)
	want := "delta(5,2)=3"
	if got != want {
		t.Fatalf("DescribeDelta mismatch: got=%q want=%q", got, want)
	}
}
