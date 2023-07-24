function printSatu()
	print("satu")
end

function printDua()
	print("dua")
end

tables = { printSatu, printDua }
tables[1]()
