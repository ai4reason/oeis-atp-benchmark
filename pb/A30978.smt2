;; sequence(s): A30978
;; terms: 0 1 4 5 8 13 18 25 32 41 50 61 72 85 98 113 128 145 162 181
;; small program: (((x * x) - 1) div (if (x - 2) <= 0 then 1 else 2)) + 1
;; fast program: (1 + (loop(x * x, (1 + 2) - x, x) * x)) div 2
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (div (- (* x x) 1) (ite (<= (- x 2) 0) 1 2)) 1))))
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (forall ((x Int)) (= (g0 x) (- (+ 1 2) x))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (div (+ 1 (* (v0 x) x)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
