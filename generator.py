# Tools to generate strings

import itertools as it
import re


class Variable:

    def __init__(self, name, iterable):
        self.name = name
        self.iterable = iterable


    def __iter__(self):
        self.iterator = iter(self.iterable)
        return self

    def __next__(self):
        return (self.name, next(self.iterator))



# a template item to generate
class TemplateItem:

    header: str
    footer: str
    command: str
    # variables are replaced in the command by name: %var%name%% will be replaced by the variable
    variables: list
    transforms: dict

    def __init__(self, command: str, variables: list = [], transforms: dict = {}, header: str = "", footer: str = ""):
        self.command = command
        self.variables = variables
        self.header = header
        self.footer = footer
        self.transforms = transforms
        self.transforms["var"] = lambda x: x


    def __str__(self):
        result = self.header
        for l in it.product(*self.variables):
            newline = self.command
            for (name, value) in l:
                # replace all occurences of the variable, transforming with a transform
                for match in re.finditer(f"%(\w+)%{name}%%", newline):
                    newline = newline.replace(match.group(0), self.transforms[match.group(1)](value))
            result += newline + "\n"
        return result + self.footer



class Generator:

    items: list

    def __init__(self, items: list = []):
        self.items = items


    def add_item(self, item):
        items.append(item)


    def __str__(self):
        result = ""
        for i in self.items:
            result += str(i) + "\n\n\n"
        return result