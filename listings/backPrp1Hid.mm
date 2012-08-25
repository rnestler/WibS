Table[{in, t} = ioPaar[[Random[Integer, {1,8}]]];
	outhid = sigmoid[wh.in];
	out = sigmoid[wo.outhid];
	(*e=t-y;*)
	e = t -out;
	outdelta = e out (1 - out);
	hiddelta = outhid (1 - outhid) Transpose[wo].outdelta;
	(* w+=eta e in;*)
	wo += eta Outer[Times, outdelta, outhid];
	wh += eta Outer[Times, hiddelta, in];
	{e.e, wo, wh}, {k, 1, iter}];
