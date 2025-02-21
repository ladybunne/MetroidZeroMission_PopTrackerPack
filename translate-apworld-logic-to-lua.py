# A script that runs a bunch of regex to translate apworld logic files into Lua.
# This is SO COOL. Super hyped that it all works!

import re
from collections.abc import Callable

# General function to actually run the translations

def translate(source: str, target: str, transformations: list[Callable[[str], None]]):
    with open(source, "r") as source_file, open(target, "w") as target_file:
        output = source_file.read()
        for transformation in transformations:
            output = transformation(output)
        target_file.write(output)


# Common replacements

def any_all(input: str) -> str:
    output = re.sub(r"any\(", r"Any(", input)
    output = re.sub(r"all\(", r"All(", output)
    return output

def none_to_true(input: str) -> str:
    return re.sub(r"None", r"True", input)

def table_strings(input: str) -> str:
    return re.sub(r"(\".*\"):", r"[\1] =", input)

def def_to_function(input: str) -> str:
    return re.sub(r"def ([\S \t]+?):(.+?)(?=\n[\S]+?|$)", r"function \1\2\nend", input, flags=re.DOTALL)
    # return re.sub(r"def ([\S\s]+?)(?=^[\S]+?)", r"function \1end\n", input, flags=re.M)

def requirement_to_option(input: str) -> str:
    return re.sub(r"Requirement.setting_is", r"OptionIs", input)

def comments(input: str) -> str:
    return re.sub(r"#", r"--", input)

def array_access(input: str) -> str:
    return re.sub(r".get\((.*)\)", r"[\1]", input)


# Region replacements

def connect_to_regions(input: str) -> str:
    return re.sub(r"", r"", input)

def create_region(input: str) -> str:
    return re.sub(r"[ \t]*create_region\(.*?(?=\")", r"CreateRegion(", input)

def connect(input: str) -> str:
    return re.sub(r"[ \t]*connect\(.*?(?=\")", r"ConnectRegions(", input)

def remove_create_rule(input: str) -> str:
    return re.sub(r"\.create_rule.*", r")", input)

def remove_trailing_parentheses(input: str) -> str:
    return re.sub(r"\(\)\)", r")", input)


# Location region mappings replacements

def remove_locationdata(input: str) -> str:
    return re.sub(r"LocationData\((.*),.*\)", r"\1", input)


# Strip start and end of relevant files.

def strip_regions_start(input: str) -> str:
    return re.sub(r"^.*?(?=    create_region\()", r"", input, flags=re.DOTALL)

def strip_location_tables_start(input: str) -> str:
    return re.sub(r"^.*?(?=brinstar_location_table)", r"", input, flags=re.DOTALL)

def strip_location_tables_end(input: str) -> str:
    return re.sub(r"(?=full_location_table).*", r"", input, flags=re.DOTALL)

def strip_location_rules_start(input: str) -> str:
    return re.sub(r"^.*?(?=brinstar_start)", r"", input, flags=re.DOTALL)

def strip_location_rules_end(input: str) -> str:
    return re.sub(r"(?=access_rules).*", r"", input, flags=re.DOTALL)

def strip_requirements_start(input: str) -> str:
    return re.sub(r"^.*?(?=Ziplines = )", r"", input, flags=re.DOTALL)

def strip_requirements_end(input: str) -> str:
    return re.sub(r"# Regional connection.*", r"", input, flags=re.DOTALL)

def strip_region_rules_start(input: str) -> str:
    return re.sub(r"^.*?(?=# Regional connection)", r"", input, flags=re.DOTALL)


# Test
# translate("test.txt", "temp/output.txt", [any_all, none_to_true, table_strings, def_to_function])

# create_regions.lua
translate("python_from_apworld/regions.py", "scripts/logic/translated_from_apworld/create_regions.lua", [
    strip_regions_start,
    any_all,
    array_access,
    create_region,
    connect,
    remove_create_rule
    ])

# location_region_mappings.lua
translate("python_from_apworld/locations.py", "scripts/logic/translated_from_apworld/location_region_mappings.lua", [
    strip_location_tables_start,
    strip_location_tables_end,
    table_strings,
    remove_locationdata
    ])

# location_rules.lua
translate("python_from_apworld/rules.py", "scripts/logic/translated_from_apworld/location_rules.lua", [
    strip_location_rules_start,
    strip_location_rules_end,
    any_all,
    array_access,
    none_to_true,
    table_strings,
    comments
    ])

# region_rules.lua
translate("python_from_apworld/rules.py", "scripts/logic/translated_from_apworld/region_rules.lua", [
    strip_region_rules_start,
    any_all,
    array_access,
    none_to_true,
    def_to_function,
    requirement_to_option,
    comments
    ])

# What am I doing with `requirements.lua`? Probably a bit hard to regex it.
