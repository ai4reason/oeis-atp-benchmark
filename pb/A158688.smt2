;; sequence(s): A158688
;; terms: 33 1122 4389 9834 17457 27258 39237 53394 69729 88242 108933 131802 156849 184074 213477 245058 278817 314754 352869 393162
;; small program: loop(1 + ((2 * (loop(x * x, 2, 2) * x)) + x), 2, x * x) - 1
;; fast program: (1 + ((x * x) * (1 + (2 * (2 * (2 * (2 + 2))))))) * (1 + (2 * (2 * (2 * (2 + 2)))))
(set-logic UFNIA)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (* x x))))
(assert (= g1 2))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ (* 2 (* v1 x)) x)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (* x x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) 1))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (* (* x x) (+ 1 (* 2 (* 2 (* 2 (+ 2 2))))))) (+ 1 (* 2 (* 2 (* 2 (+ 2 2)))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
