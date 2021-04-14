def getWelcome(meal_options, restart=False):
    meal_options_string = __convertListToNumberedString(meal_options)

    if (restart):
        return (
            "Oh no worries, we can restart the order you! 🙋\n\n"
            "{}".format(meal_options_string)
        )
    else:
        return (
            "Welcome to Mehul's Subway AI Ordering Service! 💻\n\n"
            "🍽️ What kind of meal option would you like today?\n"
            "{}".format(meal_options_string)
        )


def getAskBreads(bread_options):
    return (
        "🍞 Great Choice! Next choose your favourite bread.\n"
        "{}".format(__convertListToNumberedString(bread_options))
    )


def getAskMains(main_options):
    return (
        "🍖 Nice choice, which main would like to go with it?\n"
        "{}".format(__convertListToNumberedString(main_options))
    )


def getAskVeggies(veggie_options):
    return (
        "🥬 A healthy man is a wealthy man, come pick you veggies!\n"
        "{}".format(__convertListToNumberedString(veggie_options))
    )


def getAskSauces(sauce_options):
    return (
        "🥣 Pick your favourite sauces mmmmmm\n"
        "{}".format(__convertListToNumberedString(sauce_options))
    )


def getAskTopups(topup_options):
    return (
        "🥑 We got some great topups, yo check them out!\n"
        "{}".format(__convertListToNumberedString(topup_options))
    )


def getAskSides(side_options):
    return (
        "🍪 What'll be your choice of side today?\n"
        "{}".format(__convertListToNumberedString(side_options))
    )


def getAskDrinks(drink_options):
    return (
        "🥤 A great drink fully completes a meal, which one do you want?\n"
        "{}".format(__convertListToNumberedString(drink_options))
    )


def getOrderSummary(meals, breads, mains, veggies, sauces, topups, sides, drinks):
    return (
        "All Done! This is your final order\n\n"
        "<b>🍽️ Meal</b>\n"
        "{meals}\n"
        "<b>🍞 Bread</b>\n"
        "{breads}\n"
        "<b>🍖 Main</b>\n"
        "{mains}\n"
        "<b>🥬 Veggie</b>\n"
        "{veggies}\n"
        "<b>🥣 Sauce</b>\n"
        "{sauces}\n"
        "<b>🥑 Topup</b>\n"
        "{topups}\n"
        "<b>🍪 Side</b>\n"
        "{sides}\n"
        "<b>🥤 Drink</b>\n"
        "{drinks}\n"
        "Bye!"
    ).format(
        meals=__handleEmptyChoices(__convertListToNumberedString(meals)), 
        breads=__handleEmptyChoices(__convertListToNumberedString(breads)), 
        mains=__handleEmptyChoices(__convertListToNumberedString(mains)), 
        veggies=__handleEmptyChoices(__convertListToNumberedString(veggies)), 
        sauces=__handleEmptyChoices(__convertListToNumberedString(sauces)), 
        topups=__handleEmptyChoices(__convertListToNumberedString(topups)), 
        sides=__handleEmptyChoices(__convertListToNumberedString(sides)),
        drinks=__handleEmptyChoices(__convertListToNumberedString(drinks))
    )


def __convertListToNumberedString(list_input):
    string = ""
    for item in list_input:
        string += "• {item}\n".format(item=item.capitalize().replace("_", " "))
    return string
    

def __handleEmptyChoices(string_input):
    return "(Nothing selected)\n" if not string_input else string_input
