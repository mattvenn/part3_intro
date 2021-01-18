// A person needs to cross a river with a wolf, a goat and a cabbage. Their boat is only large
// enough to carry themselves and one of their three possessions, so they must transport these
// items one at a time. However, if they leave the wolf and the goat together unattended,
// then the wolf will eat the goat; similarly, if they leave the goat and the cabbage together
// unattended, then the goat will eat the cabbage. How can the person get across safely with
// their three items?

module wolf_goat_cabbage (input clk, input w, g, c);
	// everyone starts at the 1st river bank
	reg bank_w = 0; // wolf
	reg bank_g = 0; // goat
	reg bank_c = 0; // cabbage
	reg bank_person = 0; // person who drives the boat

	always @(posedge clk) begin
		// person travels and takes the selected item with him
		if (w && (bank_w == bank_person)) bank_w <= !bank_person;
		if (g && (bank_g == bank_person)) bank_g <= !bank_person;
		if (c && (bank_c == bank_person)) bank_c <= !bank_person;
		bank_person <= !bank_person;

		// maximum one of the control signals must be high
		assume (w+g+c <= 1);

		// we want wolf, goat, and cabbage on the 2nd river bank
        // write a cover statement that will result in the desired combination
        cover(YOUR COVER STATEMENT HERE);

		// don't leave wolf and goat unattended
		if (bank_w != bank_person) begin
			assume (bank_w != bank_g);
		end

		// don't leave goat and cabbage unattended
		if (bank_g != bank_person) begin
			assume (bank_g != bank_c);
		end
	end
endmodule
