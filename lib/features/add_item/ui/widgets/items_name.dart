itemName(int index) {
  return index == 0
      ? 'veg'
      : index == 1
          ? 'fruit'
          : index == 2
              ? 'milk'
              : index == 3
                  ? 'meat'
                  : index == 4
                      ? 'market'
                      : 'snack';
}
