class bubbleSystem {

  int q = int(random(10, 30));

  void add(Bubble b) {
    bubbles.add(b);
  }

  void blow() {
    for (int i = 0; i < bubbles.size(); i++) {
      Bubble b = (Bubble)bubbles.get(i);
      b.run();
    }
  }
}
