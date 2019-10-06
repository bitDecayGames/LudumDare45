
var prefix = choose(
	"Skinny",
	"Dr.",
	"Mr.",
	"Mrs.",
	"Fat",
	"Old Mr."
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
	"Mike"
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
	"Glass Jaw"
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
	"Himpley"
);

var suffix = choose(
	"Phd.",
	"Esquire",
	"(Deceased)",
	"III"
);


pref = 1
first = 2
nick = 4
last = 8
suff = 16

var combo = choose(
	first | last | suff,
	first | nick | last,
	pref | first,
	nick
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