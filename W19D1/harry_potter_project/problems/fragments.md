Practice your query syntax using GraphiQL to get a feel for how schemas are set up in GraphQL. For problems that accept variables make sure to test each answer you come up with with multiple `id`s to make sure they work.

1. Write a query that will return the name, founder, ghost, and animal of Gryffindor (id: 1) and Ravenclaw (id: 4). Remember to alias - then DRY up your query with a fragment!

fragment findHouse on House{
  name,
  founder,
  ghost,
  animal
}

query nameGhost($gryff: Int, $rave: Int){
  firstHouse: house(id: $gryff){
    ...findHouse
  }
  secondHouse: house(id: $rave){
    ...findHouse
  }
}

<!-- variable -->
{
  "gryff": 1,
  "rave": 4
}

2. Write a query that will return the core, length, owner name, and the name of the owner's house for both the wand with the `id` of 7 and the wand with the `id` of 10. Then use a fragment to DRY it up!

fragment wandHouseInfo on Wand {
    core,
    length,
    wizard{
        name,
        house{
            name
        }
    }
}

query wandInfo($wand1: Int, $wand2: Int){
    firstWand: wand(id: $wand1){
        ...wandHouseInfo
    }
    secondWand: wand(id: $wand2){
        ...wandHouseInfo
    }
}

<!-- variables -->
{
    "wand1": 7,
    "wand2": 10
}

3. Create a query that will accept an `id` variable and will return the patronus form associated with that `id`.
query patronusVar($idvar: Int){
  patronus(id: $idvar){
    form
  }
}

<!-- variables -->
{
    "idvar": 3
}

4. Write a query with the operation name of `FetchWizardandWand` that will accept two variables, one for a wizard to be fetched(`$wizardId`) and one for a wand to be fetched(`$wandId`). For the wizard return their name and house name. For the wand return the core, length, and the wizard's patronus form.

query FetchWizardandWand($wizardId: Int, $wandId: Int){
    wizard(id: $wizardId){
        name,
        house{
            name
        }
    }
    wand(id: $wandId){
        core,
        length,
        wizard{
            patronus{
                form
            }
        }
    }
}

<!-- variables -->
{
    "wizardId": 7,
    "wandId": 10
}

5. Now let's use variables, aliases and fragments! Write a query that will accept the `id` of two patronus. For each patronus return the form of that patronus, along with the name of the wizard that patronus belongs to.

fragment patWiz on Patronus{
  form,
  wizards{
    name
  }
}

query GetPatWiz($patone: Int, $pattwo: Int){
  firstpat: patronus(id: $patone){
    ...patWiz
  }
  secondpat: patronus(id: $pattwo){
    ...patWiz
  }
}

<!-- variables -->
{
    "patone": 7,
    "pattwo": 1
}
6. Write a query that accepts two variables for the `id`s of two houses. For each house return the names of all the wizards of that house along with the core of their wands and their patronus forms. Use a fragment!

fragment houseInfo on House{
    wizards{
        name,
        wands{
            core
        },
        patronus{
            form
        }
    }
}

query houseWand($house1: Int, $house2: Int){
    firstHouse: house(id: $house1){
        ...houseInfo
    }

    secondHouse: house(id: $house2){
        ...houseInfo
    }
}

<!-- variables -->
{
    "house1": 3,
    "house2": 1
}

7. Write a query that accepts three variables for the `id` for three separate wizards. For the first wizard return their name, house name and patronus form. For the second wizard return their name, their house name, and their wand core. For the third wizard return their name, their house name, their patronus form, and their wand core. Though you are returning different information for each wizard you are still returning the name and house name of each wizard meaning you could use a fragment to DRY this up!
fragment wizInfo on Wizard{
  name,
  house{
    name
  }
}

query wizInfoQuery($wizard1: Int, $wizard2: Int, $wizard3: Int){
  firstWiz: wizard(id: $wizard1){
    ...wizInfo,
    patronus{
      form
    }
  }
  secondWiz:wizard(id: $wizard2){
    ...wizInfo,
    wands{
      core
    }
  }
  thirdWiz:wizard(id: $wizard3){
    ...wizInfo,
    patronus{
      form
    },
    wands{
      core
    }
  }
}

<!-- variables -->
{
    "wizard1": 3,
    "wizard2": 1,
    "wizard3": 6
}
8. Write a query that will accept three variables for a query that can be broken down into three parts. The first variable will be the `id` for a house where you will return the name, founder, and patronus forms of all the wizards in that house. The second variable will be to fetch the length of a particular wand. The third variable will query to find the name, and the patronus form for the wizard with the specified id.

query threeDifferentQueries($houseId: Int, $wandId: Int, $wizardId: Int){
    house(id: $houseId){
        name,
        founder,
        wizards{
            patronus{
                form
            }
        }
    },
    wand(id: $wandId){
        length
    },
    wizard(id: $wizardId){
        name, 
        patronus{
            form
        }
    }

}

<!-- variables -->
{
    "houseId": 3,
    "wandId": 1,
    "wizardId": 6
}