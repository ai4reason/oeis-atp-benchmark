;; sequence(s): A180595
;; terms: 0 5 1 6 2 7 3 8 4 9 5 1 6 2 7 3 8 4 9 5
;; small program: loop(1 + ((1 + (2 + x)) mod (1 + (2 * (2 + 2)))), x, x)
;; fast program: (((((2 * (x + x)) + x) - 1) mod (1 + (2 * (2 + 2)))) + 1) * (if x <= 0 then 0 else 1)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (mod (+ 1 (+ 2 x)) (+ 1 (* 2 (+ 2 2))))))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (* (+ (mod (- (+ (* 2 (+ x x)) x) 1) (+ 1 (* 2 (+ 2 2)))) 1) (ite (<= x 0) 0 1)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
