// Distribute Candies to People
// We distribute some number of candies, to a row of n = num_people people in the following way:
//
// We then give 1 candy to the first person, 2 candies to the second person,
// and so on until we give n candies to the last person.
//
// Then, we go back to the start of the row, giving n + 1 candies to the first
// person, n + 2 candies to the second person, and so on until we give 2 * n candies to the last person.
//
//This process repeats (with us giving one more candy each time, and moving to
// the start of the row after we reach the end) until we run out of candies.
// The last person will receive all of our remaining candies (not necessarily one more than the previous gift).
//
//  Return an list (of length num_people and sum candies) that represents the
// final distribution of candies.
// Example
// Input: candies = 7, num_people = 4
//  Output: [1,2,3,1]
List<int> candiesDistributed(int candies, int numOfPeople) {
  if (numOfPeople == 0) {
    return [];
  }
  List distribution = List<int>.generate(numOfPeople, (i) => 0);
  while (candies > 0) {
    int remainingCandies = candies;
    for (int i = 0; i < numOfPeople; i++) {
      int candiesToGive = i + 1;
      if (candiesToGive > remainingCandies) {
        candiesToGive = remainingCandies;
      }
      distribution[i] = distribution[i] + (candiesToGive);
      remainingCandies = candies - candiesToGive;
      candies = remainingCandies;
    }
  }
  return distribution;
}

// Challenge 2
// Burst Balloons
// Given n balloons, indexed from 0 to n-1. Each balloon is painted with a number
// on it represented by array nums. You are asked to burst all the balloons.
// If the you burst balloon i you will get nums[left] * nums[i] * nums[right] coins.
// Here left and right are adjacent indices of i. After the burst, the left and
// right then becomes adjacent.
//
//  Find the maximum coins you can collect by bursting the balloons wisely.

// Stage 1
// Write a function which calculates total coins earned by bursting a balloon at index 'i'

// Stage 2
// Implement the algorithm to calculate the maximum coins that can be earned.

int coinEarnedForOneBalloon(List<int> nums, int balloonPopped) {
  balloonPopped = balloonPopped - 1;
  var left = balloonPopped < 1 ? 1 : nums[(balloonPopped - 1)];
  var right =
      balloonPopped >= (nums.length - 1) ? 1 : nums[(balloonPopped + 1)];
  // print('left:$left right:$right');// #debug
  return (left * nums[balloonPopped] * right);
}

int popThisToEarnMaxAmount(List<int> balloons) {
  var index = 1;
  if (balloons.length == 1) {
    return 1;
  } else if (balloons.length == 2) {
    return balloons[0] > balloons[1] ? 2 : 1;
  } else {
    for (int i = 1; i < balloons.length; i++) {
      int currentBallonValue = coinEarnedForOneBalloon(balloons, i);

      if (currentBallonValue > coinEarnedForOneBalloon(balloons, index)) {
        index = i;
      }
    }
  }

  return index;
}

int maxCoins2(List<int> balloons) {
  int count = balloons.length;
  int total = 0;
  while (count != 0) {
    // print('here');
    int ballonToPop = popThisToEarnMaxAmount(balloons);
    total = total + coinEarnedForOneBalloon(balloons, ballonToPop);
    print('ballonToPop:$ballonToPop');
    balloons.removeAt(ballonToPop - 1);
    count--;
  }
  return total;
}

int getMaxCoins(List<int> balloons) {
  int maxCoins = 0;
  if (balloons.length == 1) {
    return balloons[0];
  }
  for (int i = 0; i < balloons.length; i++) {
    List<int> copyBalloons = List.from(balloons);
    int coinsFromI = coinEarnedForOneBalloon(balloons, i + 1);
    // print('coinsFromI:$coinsFromI');
    copyBalloons.removeAt(i);
    coinsFromI = coinsFromI + getMaxCoins(copyBalloons);
    maxCoins = (maxCoins < coinsFromI) ? coinsFromI : maxCoins;
  }

  return maxCoins;
}

main() {
  // print(coinEarnedForOneBalloon([1, 2, 3, 4], 3));
  // print(popThisToEarnMaxAmount([1, 2, 3, 4]));
  // print(popThisToEarnMaxAmount([3, 4, 1, 8]));
  // print(popThisToEarnMaxAmount([8, 5, 3, 6]));
  // print(maxCoins([8, 5, 3, 6]));
  print(getMaxCoins([3, 1, 5, 8]));
}
