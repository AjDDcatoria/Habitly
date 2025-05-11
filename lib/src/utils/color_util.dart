String getColorString(int index) {
  switch (index) {
    case 0:
      return 'lightCream';
    case 1:
      return 'peach';
    case 2:
      return 'taupe';
    case 3:
      return 'beige';
    case 4:
      return 'coral';
    case 5:
      return 'softPink';
    case 6:
      return 'candyPink';
    case 7:
      return 'lavenderPink';
    case 8:
      return 'softPurple';
    case 9:
      return 'periwinkle';
    case 10:
      return 'babyBlue';
    case 11:
      return 'mutedTeal';
    case 12:
      return 'skyBlue';
    case 13:
      return 'mintGreen';
    case 14:
      return 'creamOrange';
    default:
      return 'lightborder';
  }
}

int getIndexColor(String color) {
  switch (color) {
    case 'lightCream':
      return 0;
    case 'peach':
      return 1;
    case 'taupe':
      return 2;
    case 'beige':
      return 3;
    case 'coral':
      return 4;
    case 'softPink':
      return 5;
    case 'candyPink':
      return 6;
    case 'lavenderPink':
      return 7;
    case 'softPurple':
      return 8;
    case 'periwinkle':
      return 9;
    case 'babyBlue':
      return 10;
    case 'mutedTeal':
      return 11;
    case 'skyBlue':
      return 12;
    case 'mintGreen':
      return 13;
    case 'creamOrange':
      return 14;
    default:
      return -1; // or some default value
  }
}
