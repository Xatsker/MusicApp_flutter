//Design For Main Page

/*
Column(
//mainAxisAlignment: MainAxisAlignment.center,
//crossAxisAlignment: CrossAxisAlignment.stretch,
children: [
Row(
mainAxisAlignment: MainAxisAlignment.spaceAround,
//crossAxisAlignment: CrossAxisAlignment.center,
children: [
const SizedBox(
height: 350,
),
SvgPicture.asset("assets/images/Vector.svg"),
const Text('Notohram', style: TextStyle(
fontFamily: "ReenieBeanie", fontSize: 70, fontWeight: FontWeight.normal),
textAlign: TextAlign.center,
),
]
),
ElevatedButton(
onPressed: () {

},
child: const Text('ТЕОРИЯ', style: TextStyle(
fontFamily: "Roboto",
letterSpacing: 1.5,
),),
style: ElevatedButton.styleFrom(
fixedSize: const Size(328, 50), primary: mainColor),
),
const SizedBox(
height: 33,
),
ElevatedButton(
onPressed: () {

},
child: const Text('ПРАКТИКА', style: TextStyle(
fontFamily: "Roboto",
letterSpacing: 1.5,
),),
style: ElevatedButton.styleFrom(
fixedSize: const Size(328, 50), primary: mainColor),
),
],
),
 */

//NAVBAR

/*
return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: mainColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[900],
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Главная",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.menu_book_outlined),
            label: "Теория",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.handyman),
            label: "Практика",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.stacked_bar_chart),
            label: "Статистика",
          )
        ],
      ),
    );
 */