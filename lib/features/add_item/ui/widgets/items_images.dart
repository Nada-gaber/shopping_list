itemImage(index) {
  return index == 0
      ? 'image/veg.png'
      : index == 1
          ? 'image/banana.png'
          : index == 2
              ? 'image/milk.png'
              : index == 3
                  ? 'image/meat.png'
                  : index == 4
                      ? 'image/flour.png'
                      : 'image/chips.png';
}
