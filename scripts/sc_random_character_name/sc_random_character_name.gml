
var prefix = choose(
	"Skinny",
	"Dr.",
	"Mr.",
	"Mrs.",
	"Fat",
	"Old Mr.",
	"Sultan",
	"Stinky",
	"Speedy",
	"Lazy",
	"Blind",
	"Sir",
	"Madam",
	"Poor",
	"Crazy",
);

var firstName = choose(
	"John",
	"Chuck",
	"Flint",
	"Allister",
	"Jane",
	"Larry",
	"Durf",
	"Sally",
	"Jonny",
	"Jake",
	"Joseph",
	"Mike",
	"Luke",
	"Logan",
	"Tanner",
	"Tristan",
	"Eric",
	"Bui",
	"Corwin",
	"Brittany",
	"Francis",
	"Frank",
	"Forest",
	"Philip",
	"Will",
	"William",
	"Bill",
	"Paul",
	"Burt",
	"Bart",
	"Charles",
	"Ben",
	"Joe",
	"Chandler",
	"Kat",
	"Sharon",
	"Jane",
	"Michael",
	"Janet",
	"Dwight",
	"Jim",
	"Angela",
	"Karren",
	"Pam",
	"Andy",
	"Kelly",
);

var nickname = choose(
	"The Hospital",
	"Pigknuckle",
	"The Tickler",
	"The Orphanage",
	"Vengence",
	"The Teeth",
	"19 Wheels",
	"Scar",
	"Glass Jaw",
	"The Fisher",
	"9 Lives",
	"Ball Dropper",
	"The Beast",
	"Pickle",
	"The Pacifist",
	"Taco Muncher",
	"Nip Twister",
);

var lastName = choose(
	"Fist",
	"McKinnley",
	"Cole",
	"Jones",
	"Speed",
	"Johnson",
	"Smith",
	"Sniff",
	"Blaze",
	"Himpley",
	"Scott",
	"Bernard",
	"Howard",
	"Martin",
);

var suffix = choose(
	"Phd.",
	"Esquire",
	"(Deceased)",
	"III",
	"LPC",
	"LLC",
	"Inc."
);


pref = 1
first = 2
nick = 4
last = 8
suff = 16

var combo = choose(
	first | last | suff,
	first | nick | last,
	pref | first
);

var name = "";

if (combo & pref){
	name += prefix + " ";
}
if (combo & first) {
	name += firstName + " ";	
}
if (combo & nick) {
	name += "\"" + nickname + "\" ";
}
if (combo & last) {
	name += lastName + " ";
}
if (combo & suff) {
	name += suffix + " ";
}

return name;