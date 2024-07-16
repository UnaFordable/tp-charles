/// @description Insert description here
// You can write your code in this editor
instance_deactivate_all(true);
hover = 0;
enum CATEGORY{
	A,
	B
}
level = CATEGORY.A;
lore = {
	Character1:{
		Lyraka: {
			//                                    |
			desc: @"Lyraka: Presumed God of Destruction

A submissive creature awakened from the Turning
Point. The legend claims it to be an almighty
god who can erase the universe with a thought,
but does not present such raw power.

Lyraka does not talk. So partners must assume
many things about it. Including name and gender.

She fights by using the Turning Point like a big
hammer, she later learns other skills 
unconventional to standard attacks.",
			animation: spr_lyraka_idle_1
		},
		Baxter:{
			desc: @"Baxter the dog

Dominant, disagreeable, and Lyraka's first friend.
Baxter travelled to Lateotu in search for the 
Turning Point, hoping to use it to end Rosetta's 
wrath once and for all. Unfortunately, he found 
a weak creature who has trouble to keep up with 
his combat skills.

He believes that if Lyraka battle powerful 
humans, it will help reawaken its powers.",
			animation: spr_baxter_idle
		},
		Donohue:{
			desc: @"Donohue the Eagle

Dominant and agreeable. A Native to Lateotu.
He serves as a scout to find new lands to form
nests in. He once narrowly escaped enslavement 
from Rossetta and her squad, and now must 
journey back home to warn his fellow eagles.

Since Donohue's flock have a different beliefs 
from Rossetta's, he knows his people are in threat 
of being destroyed.

Donohue fights with plasma guns crafted by his
flock's weapon's experts",
			animation: spr_donohue_idle
		},
		Shelly:{
			desc: @"Shelly the sea snail

Submissive and disagreeable. Donohue's apprentice.

Donohue uses Shelly like a slimy shield",
			animation: spr_shelly_idle
		},
		/*
		Nac:{
			desc:@"Nac

Baxter's baby brother.",
			animation: spr_shelly_idle
		}
		*/
		
	},
	Character2:{
		
	},
	Enemies:{
		
	}
}
path = lore.Character1;