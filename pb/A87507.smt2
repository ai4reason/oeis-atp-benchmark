;; sequence(s): A87507
;; terms: 1 1 1 4 2 2 7 3 3 10 4 4 13 5 5 16 6 6 19 7
;; small program: 1 + (x div (1 + (if (x mod (1 + 2)) <= 0 then 0 else 2)))
;; fast program: loop(x div (1 + 2), (x * x) mod (1 + 2), x) + 1
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (div x (+ 1 (ite (<= (mod x (+ 1 2)) 0) 0 2)))))))
(assert (forall ((x Int)) (= (f0 x) (div x (+ 1 2)))))
(assert (forall ((x Int)) (= (g0 x) (mod (* x x) (+ 1 2)))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (v0 x) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)