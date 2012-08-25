OutFunktion[x_] := Which[x < 0, -1, x>0, 1, x==0, 0]
SetAtributes[OutFunktion, Listable]
OutFunktion[{0.5, -0.0, 5}]
Do[y = OutFunktion[w.x]; Print[y, " ", EnergieHop[y,w]];
	x = y, {i,1,10}]
