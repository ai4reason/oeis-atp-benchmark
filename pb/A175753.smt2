;; sequence(s): A175753
;; terms: 12582912 20971520 29360128 46137344 54525952 71303168 79691776 96468992 121634816 130023424 155189248 171966464 180355072 197132288 222298112 247463936 255852544 281018368 297795584 306184192
;; small program: loop2((compr(loop((1 - loop(x + x, x div 2, 1)) mod (1 + x), (1 + x) mod 2, x) - 2, 1 + y) + 1) * x, 0, (2 * (2 * (2 + (2 + 2)))) - 1, 1, 1 + x)
;; fast program: ((((((((((((((((((((compr(loop((1 - loop(x + x, (x - 1) div 2, 2)) mod (1 + x), (1 + x) mod 2, x) - 2, 2 + x) * 2) + 2) * 2) * 2) * 2) * 2) * 2) * 2) * 2) * 2) * 2) * 2) * 2) * 2) * 2) * 2) * 2) * 2) * 2) * 2) * (2 * (2 + 2))
(set-logic UFNIA)
(declare-fun f3 (Int) Int)
(declare-fun g3 (Int) Int)
(declare-fun h3 () Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 (Int) Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int Int) Int)
(declare-fun t1 (Int) Int)
(declare-fun u1 (Int) Int)
(declare-fun v1 (Int Int) Int)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun i0 () Int)
(declare-fun j0 (Int) Int)
(declare-fun u0 (Int Int Int) Int)
(declare-fun v0 (Int Int Int) Int)
(declare-fun w0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f6 (Int) Int)
(declare-fun g6 (Int) Int)
(declare-fun h6 () Int)
(declare-fun u6 (Int Int) Int)
(declare-fun v6 (Int) Int)
(declare-fun f5 (Int) Int)
(declare-fun g5 (Int) Int)
(declare-fun h5 (Int) Int)
(declare-fun u5 (Int Int) Int)
(declare-fun v5 (Int) Int)
(declare-fun f4 (Int) Int)
(declare-fun g4 (Int) Int)
(declare-fun t4 (Int) Int)
(declare-fun u4 (Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f3 x) (+ x x))))
(assert (forall ((x Int)) (= (g3 x) (div x 2))))
(assert (= h3 1))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (forall ((x Int)) (= (v3 x) (u3 (g3 x) h3))))
(assert (forall ((x Int)) (= (f2 x) (mod (- 1 (v3 x)) (+ 1 x)))))
(assert (forall ((x Int)) (= (g2 x) (mod (+ 1 x) 2))))
(assert (forall ((x Int)) (= (h2 x) x)))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 (g2 x) (h2 x)))))
(assert (forall ((x Int)) (= (f1 x) (- (v2 x) 2))))
(assert (forall ((x Int) (y Int)) (= (g1 x y) (+ 1 y))))
(assert (forall ((x Int)) (= (t1 x) (ite (<= (f1 x) 0) x (t1 (+ x 1))))))
(assert (forall ((x Int)) (= (u1 x) (ite (<= x 0) (t1 0) (t1 (+ (u1 (- x 1)) 1))))))
(assert (forall ((x Int) (y Int)) (= (v1 x y) (u1 (g1 x y)))))
(assert (forall ((x Int) (y Int)) (= (f0 x y) (* (+ (v1 x y) 1) x))))
(assert (= g0 0))
(assert (= h0 (- (* 2 (* 2 (+ 2 (+ 2 2)))) 1)))
(assert (= i0 1))
(assert (forall ((x Int)) (= (j0 x) (+ 1 x))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u0 x y z) (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v0 x y z) (ite (<= x 0) z g0))))
(assert (forall ((x Int)) (= (w0 x) (u0 h0 i0 (j0 x)))))
(assert (forall ((x Int)) (= (small x) (w0 x))))
(assert (forall ((x Int)) (= (f6 x) (+ x x))))
(assert (forall ((x Int)) (= (g6 x) (div (- x 1) 2))))
(assert (= h6 2))
(assert (forall ((x Int) (y Int)) (= (u6 x y) (ite (<= x 0) y (f6 (u6 (- x 1) y))))))
(assert (forall ((x Int)) (= (v6 x) (u6 (g6 x) h6))))
(assert (forall ((x Int)) (= (f5 x) (mod (- 1 (v6 x)) (+ 1 x)))))
(assert (forall ((x Int)) (= (g5 x) (mod (+ 1 x) 2))))
(assert (forall ((x Int)) (= (h5 x) x)))
(assert (forall ((x Int) (y Int)) (= (u5 x y) (ite (<= x 0) y (f5 (u5 (- x 1) y))))))
(assert (forall ((x Int)) (= (v5 x) (u5 (g5 x) (h5 x)))))
(assert (forall ((x Int)) (= (f4 x) (- (v5 x) 2))))
(assert (forall ((x Int)) (= (g4 x) (+ 2 x))))
(assert (forall ((x Int)) (= (t4 x) (ite (<= (f4 x) 0) x (t4 (+ x 1))))))
(assert (forall ((x Int)) (= (u4 x) (ite (<= x 0) (t4 0) (t4 (+ (u4 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x)))))
(assert (forall ((x Int)) (= (fast x) (* (* (* (* (* (* (* (* (* (* (* (* (* (* (* (* (* (* (* (+ (* (v4 x) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) 2) (* 2 (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
