;; sequence(s): A167931-A168697-A168745-A168793-A168841-A168889-A168937-A168985-A169033-A169081-A169129-A169177-A169225-A169273-A169321-A169369-A169417-A169465-A169513-A169561-A170029-A170077-A170125-A170173-A170221-A170269-A170317-A170365-A170413-A170461-A170509-A170557-A170605-A170653-A170701-A170739
;; terms: 1 20 380 7220 137180 2606420 49521980 940917620 17877434780 339671260820 6453753955580 122621325156020 2329805177964380 44266298381323220 841059669245141180 15980133715657682420
;; small program: loop((loop(2 * (2 + x), 2, 2) - (1 mod x)) * x, x, 1)
;; fast program: loop2(x * y, y, x - 1, 1, 1 + (2 + (2 * (2 * (2 + 2))))) * (if x <= 0 then 1 else (2 * (2 + (2 * (2 + 2)))))
(set-logic UFNIA)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int Int) Int)
(declare-fun g2 (Int Int) Int)
(declare-fun h2 (Int) Int)
(declare-fun i2 () Int)
(declare-fun j2 () Int)
(declare-fun u2 (Int Int Int) Int)
(declare-fun v2 (Int Int Int) Int)
(declare-fun w2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f1 x) (* 2 (+ 2 x)))))
(assert (= g1 2))
(assert (= h1 2))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (f0 x) (* (- v1 (mod 1 x)) x))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int) (y Int)) (= (f2 x y) (* x y))))
(assert (forall ((x Int) (y Int)) (= (g2 x y) y)))
(assert (forall ((x Int)) (= (h2 x) (- x 1))))
(assert (= i2 1))
(assert (= j2 (+ 1 (+ 2 (* 2 (* 2 (+ 2 2)))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (u2 x y z) (ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int) (y Int) (z Int)) (= (v2 x y z) (ite (<= x 0) z (g2 (u2 (- x 1) y z) (v2 (- x 1) y z))))))
(assert (forall ((x Int)) (= (w2 x) (u2 (h2 x) i2 j2))))
(assert (forall ((x Int)) (= (fast x) (* (w2 x) (ite (<= x 0) 1 (* 2 (+ 2 (* 2 (+ 2 2)))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)