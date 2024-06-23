import 'package:flutter/material.dart';

void main() {
  runApp(const EcoCraftApp());
}

// Base
class EcoCraftApp extends StatelessWidget {
  const EcoCraftApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EcoCraft',
      theme: ThemeData(
        primaryColor: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        "/": (context) => const HomePage(),
        "/main": (context) => const MainPage(),
        "/eco": (context) => const EcoPage(),
        "/plastic_bag": (context) =>  const PlasticBagPage(),
        "/plastic_bottle": (context) =>  const PlasticBottlePage(),
        "/plastic_packaging": (context) =>  const PlasticPackagingPage(),
      },
    );
  }
}

// First
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/final-transformed.jpeg",
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                "Is this really the future we all dreamed of?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Younger", // Changed font family here
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/main");
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                  child: const Text(
                    "STOP IT!",
                    style: TextStyle(
                      fontFamily: "Younger", // Changed font family here
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Second
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/eco.png", height: 150),
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0.0,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  """
Dear User,

I hope this message finds you well. I'm excited to share with you the main idea behind our program, EcoCraft, which aims to address the urgent issue of plastic waste by offering practical and creative solutions.

In today's world, plastic products like bottles, bags, and packaging have become ubiquitous, but unfortunately, they also contribute significantly to environmental pollution. Recognizing this challenge, EcoCraft is designed to empower individuals with actionable advice on how to responsibly manage and repurpose these items.

Our program provides a wealth of ideas and suggestions on how to transform everyday plastic items into useful and innovative creations. Whether it's up-cycling plastic bottles into planters, weaving plastic bags into durable mats, or repurposing plastic packaging for arts and crafts projects, EcoCraft encourages individuals to rethink their relationship with plastic and explore alternative ways to reduce waste.

By promoting creativity, resourcefulness, and sustainability, EcoCraft not only helps divert plastic from landfills and oceans but also fosters a culture of environmental consciousness and community engagement. Together, we can turn the tide on plastic pollution and create a cleaner, greener future for generations to come.

Thank you for your interest in EcoCraft. I invite you to join us on this journey towards a more sustainable world.

Warm regards
                """,
                  style: TextStyle(
                    fontFamily: "Younger", // Changed font family here
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/eco");
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontFamily: "Younger", // Changed font family here
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// EcoPage
class EcoPage extends StatefulWidget {
  const EcoPage({super.key});

  @override
  State<EcoPage> createState() => _EcoPageState();
}

class _EcoPageState extends State<EcoPage> {
  late PageController _pageController;
  List<Map<String, dynamic>> containers = [
    {
      'image': 'Icons/plastic-bottle.png',
      'text': 'Plastic Bottle',
      'route': '/plastic_bottle',
    },
    {
      'image': 'Icons/bag.png',
      'text': 'Plastic Bag',
      'route': '/plastic_bag',
    },
    {
      'image': 'Icons/box.png',
      'text': 'Plastic Packaging',
      'route': '/plastic_packaging',
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: containers.length * 1000);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "What you want to reuse?",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 300),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: containers.length * 10000,
                  itemBuilder: (context, index) {
                    final itemIndex = index % containers.length;
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(containers[itemIndex]['route']);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                          border: Border.all(color: Colors.black),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image.asset(
                                containers[itemIndex]['image'],
                                fit: BoxFit.contain,
                              ),
                            ),
                            Text(
                              containers[itemIndex]['text'],
                              style: const TextStyle(color: Colors.black, fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HorizontalCategoryList extends StatefulWidget {
  final List<String> categories;
  final ValueChanged<String> onCategorySelected;

  const HorizontalCategoryList({
    super.key,
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  State<HorizontalCategoryList> createState() => _HorizontalCategoryListState();
}

class _HorizontalCategoryListState extends State<HorizontalCategoryList> {
  late String _selectedCategory;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.categories.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50, // Height of the category list
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          final category = widget.categories[index];
          final isSelected = _selectedCategory == category;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategory = category;
              });
              widget.onCategorySelected(category);
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? Colors.green : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? Colors.green : Colors.black,
                  width: 1,
                ),
              ),
              child: Text(
                category,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PlasticBottlePage extends StatelessWidget {
  const PlasticBottlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plastic Bottle'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildIdeaCard(
              context,
              'Plastic Bottle Planters',
              'assets/planters.jpg',
            ),
            buildIdeaCard(
              context,
              'Plastic Bottle Bird Feeder',
              'assets/birdfeeder.jpg',
            ),
            buildIdeaCard(
              context,
              'Plastic Bottle Herb Garden',
              'assets/herbgarden.jpg',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIdeaCard(BuildContext context, String title, String imagePath) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PlasticBottleIdeaPage(idea: title)),
        );
      },
      child: Card(
        elevation: 3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}


class PlasticBottleIdeaPage extends StatelessWidget {
  final String idea;

  const PlasticBottleIdeaPage({super.key, required this.idea});

  @override
  Widget build(BuildContext context) {
    String instructions = '';

    switch (idea) {
      case 'Plastic Bottle Planters':
        instructions = '''
          Materials Needed:
          - Plastic bottles
          - Scissors
          - Potting soil
          - Small plants or seeds
          - Paint (optional)
          - Decorative materials (optional)

          Instructions:
          1. Clean and dry the plastic bottles thoroughly.
          2. Use scissors to cut the bottles in half horizontally. You can adjust the height depending on the size of the plant you want to grow.
          3. Poke some small drainage holes in the bottom of each half.
          4. If desired, paint the outsides of the bottle halves with acrylic paint and let them dry completely.
          5. Fill each bottle half with potting soil.
          6. Plant small plants or seeds in the soil.
          7. Water the plants and place the bottle halves in a sunny spot.
          8. Optionally, you can decorate the outsides of the bottles with stickers, ribbons, or any other decorative materials.
        ''';
        break;
      case 'Plastic Bottle Bird Feeder':
        instructions = '''
          Materials Needed:
          - Plastic bottle
          - Wooden spoons or chopsticks
          - Utility knife
          - Birdseed
          - String

          Instructions:
          1. Clean and dry the plastic bottle thoroughly.
          2. Use a utility knife to carefully cut several small holes around the bottle, about 2-3 inches from the bottom.
          3. Insert wooden spoons or chopsticks through the holes to create perches for the birds.
          4. Make a hole in the bottle cap large enough for the birdseed to come out.
          5. Fill the bottle with birdseed through the top.
          6. Screw the cap back on.
          7. Use string to hang the bottle feeder from a tree branch or hook.
          8. Watch as the birds come to feed!
        ''';
        break;
      case 'Plastic Bottle Herb Garden':
        instructions = '''
          Materials Needed:
          - Plastic bottles
          - Scissors
          - Potting soil
          - Herb seeds or small herb plants

          Instructions:
          1. Clean and dry the plastic bottles thoroughly.
          2. Cut the bottles horizontally, leaving the bottom part slightly taller than the top part.
          3. Use the bottom part as a pot by adding potting soil into it.
          4. Plant herb seeds or small herb plants in the soil.
          5. Place the top part of the bottle inverted over the bottom part to create a mini greenhouse effect.
          6. Water the herbs regularly and ensure they get enough sunlight.
          7. Once the herbs grow, you can remove the top part of the bottle or leave it as a protective cover during colder days.
          8. Enjoy fresh herbs grown from your plastic bottle garden!
        ''';
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(idea),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Text(
          instructions,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}


class PlasticBagPage extends StatelessWidget {
  const PlasticBagPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plastic Bag'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildIdeaCard(
              context,
              'Plastic Bag Crochet Basket',
              'assets/crochetbasket.jpg',
            ),
            buildIdeaCard(
              context,
              'Plastic Bag Weaving',
              'assets/weaving.jpg',
            ),
            buildIdeaCard(
              context,
              'Plastic Bag Pom-Poms',
              'assets/pompom.jpg',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIdeaCard(BuildContext context, String title, String imagePath) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PlasticBagIdeaPage(idea: title)),
        );
      },
      child: Card(
        elevation: 3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}



class PlasticBagIdeaPage extends StatelessWidget {
  final String idea;

  const PlasticBagIdeaPage({super.key, required this.idea});

  @override
  Widget build(BuildContext context) {
    String instructions = '';

    switch (idea) {
      case 'Plastic Bag Crochet Basket':
        instructions = '''
          Materials Needed:
          - Plastic bags (multiple colors if desired)
          - Scissors
          - Crochet hook

          Instructions:
          1. Flatten the plastic bags and cut them into strips, about 1 inch wide.
          2. Tie the strips together to form a long strand.
          3. Start crocheting using the plastic bag strips. You can use a simple single crochet stitch to create a circular base.
          4. Continue crocheting in rounds, increasing stitches gradually to form the sides of the basket.
          5. If desired, switch colors of plastic bag strips to create a striped pattern.
          6. Once you reach the desired height, finish off the basket with a slip stitch and weave in any loose ends.
          7. You can add handles by crocheting extra strips and attaching them to the sides.
          8. Use your plastic bag crochet basket for storing various items like yarn, toys, or as a decorative piece.
        ''';
        break;
      case 'Plastic Bag Weaving':
        instructions = '''
          Materials Needed:
          - Plastic bags (different colors)
          - Cardboard or a simple loom
          - Scissors

          Instructions:
          1. Cut the plastic bags into strips, ensuring they're of consistent width.
          2. Create a simple loom by cutting notches along the edges of a rectangular piece of cardboard or using a frame loom.
          3. Warp the loom by tying one end of the plastic bag strips to the top of the loom and then weaving them through the notches to the bottom, creating a tight grid.
          4. Begin weaving the plastic bag strips horizontally through the warp threads, alternating over and under each thread.
          5. Continue weaving until you reach the desired length, periodically pushing the woven rows down tightly to ensure a compact weave.
          6. Once finished, tie off the ends of the plastic bag strips and trim any excess.
          7. You can create patterns and designs by using different colored plastic bag strips.
          8. Use your woven plastic bag fabric to make coasters, placemats, or even small bags.
        ''';
        break;
      case 'Plastic Bag Pom-Poms':
        instructions = '''
          Materials Needed:
          - Plastic bags (various colors)
          - Scissors
          - Cardboard

          Instructions:
          1. Flatten the plastic bags and cut them into rectangular strips, about 1 inch wide and 6 inches long.
          2. Stack several strips on top of each other and fold them in half lengthwise.
          3. Place the folded strips on a piece of cardboard and wrap them around the cardboard widthwise, forming a bundle.
          4. Secure the bundle in the middle with a separate strip of plastic bag tied tightly around it.
          5. Use scissors to cut through the loops on both ends of the bundle.
          6. Fluff out the cut strips to form a pom-pom shape.
          7. Trim any uneven edges to create a neat, round pom-pom.
          8. Repeat the process to make multiple pom-poms in various colors and sizes, then use them to embellish hats, bags, or as decorations for gifts.
        ''';
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(idea),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Text(
          instructions,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class PlasticPackagingPage extends StatelessWidget {
  const PlasticPackagingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plastic Packaging'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildIdeaCard(
              context,
              'Plastic Packaging Gift Tags',
              'assets/gifttag.jpg',
            ),
            buildIdeaCard(
              context,
              'Plastic Packaging Stencil Art',
              'assets/stencilart.jpg',
            ),
            buildIdeaCard(
              context,
              'Plastic Packaging Collage',
              'assets/collage.jpg',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIdeaCard(BuildContext context, String title, String imagePath) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PlasticPackagingIdeaPage(idea: title)),
        );
      },
      child: Card(
        elevation: 3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}


class PlasticPackagingIdeaPage extends StatelessWidget {
  final String idea;

  const PlasticPackagingIdeaPage({super.key, required this.idea});

  @override
  Widget build(BuildContext context) {
    String instructions = '';

    switch (idea) {
      case 'Plastic Packaging Gift Tags':
        instructions = '''
          Materials Needed:
          - Clean plastic packaging (from food containers, blister packs, etc.)
          - Scissors
          - Hole punch
          - Markers or paint (optional)

          Instructions:
          1. Flatten and clean the plastic packaging thoroughly.
          2. Use scissors to cut out small rectangular or square shapes from the plastic packaging.
          3. Round the corners of the cutouts to give them a polished look.
          4. If desired, decorate the tags with markers or paint. You can add designs, patterns, or even write messages.
          5. Use a hole punch to make a hole at the top of each tag.
          6. Thread a piece of ribbon or twine through the hole.
          7. Attach the tag to a gift by tying it around the package or using adhesive.
          8. Your unique and eco-friendly gift tags are ready to adorn your presents!
        ''';
        break;
      case 'Plastic Packaging Stencil Art':
        instructions = '''
          Materials Needed:
          - Clean plastic packaging (sturdy enough to be used as a stencil)
          - Craft knife or scissors
          - Acrylic paint
          - Paintbrushes
          - Paper or canvas

          Instructions:
          1. Choose a piece of clean plastic packaging that is sturdy enough to be used as a stencil.
          2. Use a craft knife or scissors to carefully cut out a design or shape from the plastic packaging. Simple shapes like stars, hearts, or geometric patterns work well.
          3. Place the plastic stencil onto a piece of paper or canvas.
          4. Hold the stencil firmly in place and apply acrylic paint over it using a paintbrush or sponge.
          5. Carefully lift the stencil to reveal the painted design underneath.
          6. Allow the paint to dry completely.
          7. Repeat the process with different stencils and colors to create a layered effect or a pattern.
          8. Frame your stencil art or use it to embellish greeting cards, notebooks, or other craft projects.
        ''';
        break;
      case 'Plastic Packaging Collage':
        instructions = '''
          Materials Needed:
          - Clean plastic packaging (various colors and textures)
          - Scissors
          - Glue
          - Canvas or sturdy cardboard

          Instructions:
          1. Gather a variety of clean plastic packaging in different colors and textures. This can include pieces from food packaging, bubble wrap, plastic bags, etc.
          2. Use scissors to cut the plastic packaging into different shapes and sizes. You can cut out geometric shapes, abstract forms, or even words and letters.
          3. Arrange the cut pieces of plastic packaging on a canvas or sturdy cardboard, experimenting with different compositions and layering.
          4. Once you're happy with the arrangement, use glue to secure the pieces onto the surface.
          5. Continue adding more pieces until the entire surface is covered, overlapping pieces for added texture and depth.
          6. Allow the glue to dry completely.
          7. Optionally, you can further embellish the collage with paint, markers, or other decorative elements.
          8. Display your unique plastic packaging collage as a piece of eco-friendly art!
        ''';
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(idea),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Text(
          instructions,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}