#include "config.h"

namespace betterls {
class internal {
   public:
	std::string get_file_contents(const char* filename) {
		std::ifstream in(filename, std::ios::in | std::ios::binary);
		if (!in) {
			fmt::print(stderr, "could not open file `{}`.\n", filename);
			exit(EXIT_FAILURE);
		};
		std::ostringstream contents;
		contents << in.rdbuf();
		return contents.str();
	};

   public:
	static void write_config_file() {
		static std::string config_file = "~\\.config\\.betterlsrc.json";
		fmt::print("config file: {}\n", config_file);
	};

   public:
	void load_config_file(const char* file) { std::string contents = get_file_contents(file); };
};	// class internal
};	// namespace betterls
