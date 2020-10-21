module dsemver.options;

import std.typecons : Nullable, nullable, Tuple, tuple;
import args;

struct Options {
	//@Arg('p', Optional.no,
	@Arg('p', "The path to the project the SemVer should be calculated for")
	string projectPath;

	@Arg('o')
	string old;

	@Arg('n')
	string neu;

	@Arg('t')
	string testParse;

	@Arg('l', "Compute the interface of the latest git tag as reference")
	bool buildLastestTag;

	@Arg('c', "Compute the next version number")
	bool buildNextSemVer;

	@Arg('v', "Enable verbose output")
	bool verbose;
}

ref const(Options) getOptions() {
	return getWritableOptions();
}

ref Options getWritableOptions() {
	static Options ret;
	return ret;
}

void getOptOptions(ref string[] args) {
	import core.stdc.stdlib : exit;
	bool helpWanted = parseArgsWithConfigFile(getWritableOptions(), args);
	if(helpWanted) {
		printArgsHelp(getOptions(), "A text explaining the program");
		exit(0);
	}
}
