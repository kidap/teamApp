//
//  ViewController.m
//  teamApp
//
//  Created by Karlo Pagtakhan on 02/08/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell_Schedule.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIImageView *playerImage;
@property (strong, nonatomic) IBOutlet UILabel *playerLabel;
@property (strong, nonatomic) IBOutlet UILabel *playerPoints;

@end

@implementation ViewController

NSMutableArray *lineup;
NSMutableArray *schedule;
NSMutableDictionary *selectedPlayer;

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  //Add players@
  if (lineup.count <= 0) {
    lineup = [[NSMutableArray alloc] init];
    
    //Create Players - individually
    NSMutableDictionary *player = [NSMutableDictionary dictionaryWithDictionary:
                                   @{ @"name" : @"Kawhi Leonard",
                                      @"num"  : @"2",
                                      @"pos"  : @"SF",
                                      @"ppg"  : @"20.0",
                                      @"img": @"kawhileonard"
                                      }];
    [lineup addObject:player];
    
    NSMutableDictionary *player2 = [NSMutableDictionary dictionaryWithDictionary:
                                    @{ @"name" : @"LaMarcus Aldridge",
                                       @"num"  : @"12",
                                       @"pos"  : @"PF",
                                       @"ppg"  : @"16.7",
                                       @"img": @"lamarcusaldridge"
                                      }];
    [lineup addObject:player2];
    
    NSMutableDictionary *player3 = [NSMutableDictionary dictionaryWithDictionary:
                                    @{ @"name" : @"Tony Parker",
                                       @"num"  : @"9",
                                       @"pos"  : @"PG",
                                       @"ppg"  : @"12.1",
                                       @"img": @"tonyparker"
                                       }];
    [lineup addObject:player3];
    
    NSMutableDictionary *player4 = [NSMutableDictionary dictionaryWithDictionary:
                                    @{ @"name" : @"Tim Duncan",
                                       @"num"  : @"21",
                                       @"pos"  : @"PF",
                                       @"ppg"  : @"8.9",
                                       @"img": @"timduncan"
                                       }];
    [lineup addObject:player4];
    
    NSMutableDictionary *player5 = [NSMutableDictionary dictionaryWithDictionary:
                                    @{ @"name" : @"Manu Ginobili",
                                       @"num"  : @"20",
                                       @"pos"  : @"SG",
                                       @"ppg"  : @"10.0",
                                       @"img": @"manuginobili"
                                       }];
    [lineup addObject:player5];
    
    NSMutableDictionary *player6 = [NSMutableDictionary dictionaryWithDictionary:
                                    @{ @"name" : @"Patty Mills",
                                       @"num"  : @"8",
                                       @"pos"  : @"PG",
                                       @"ppg"  : @"8.2",
                                       @"img": @"pattymills"
                                       }];
    [lineup addObject:player6];
    
    NSMutableDictionary *player7 = [NSMutableDictionary dictionaryWithDictionary:
                                    @{ @"name" : @"Danny Green",
                                       @"num"  : @"14",
                                       @"pos"  : @"SG",
                                       @"ppg"  : @"7.3",
                                       @"img": @"dannygreen"
                                       }];
    [lineup addObject:player7];
    
    NSMutableDictionary *player8 = [NSMutableDictionary dictionaryWithDictionary:
                                    @{ @"name" : @"David West",
                                       @"num"  : @"30",
                                       @"pos"  : @"PF",
                                       @"ppg"  : @"6.8",
                                       @"img": @"davidwest"
                                       }];
    [lineup addObject:player8];
    
    NSMutableDictionary *player9 = [NSMutableDictionary dictionaryWithDictionary:
                                    @{ @"name" : @"Boris Diaw",
                                       @"num"  : @"33",
                                       @"pos"  : @"PF",
                                       @"ppg"  : @"6.6",
                                       @"img": @"borisdiaw"
                                       }];
    [lineup addObject:player9];
    
    self.playerImage  = [[UIImageView alloc] init];
    self.playerLabel  = [[UILabel alloc] init];
    self.playerPoints = [[UILabel alloc] init];
    
    selectedPlayer = [[NSMutableDictionary alloc] init];
  }
  
  if (schedule.count <= 0) {
    schedule = [[NSMutableArray alloc] init];
    
    //Block declaration
    void (^addGameSchedule)(NSString *date, NSString *team1, NSString *team2);
    
    //Block implementation
    addGameSchedule = ^void(NSString *date, NSString *team1, NSString *team2){
      
      NSMutableDictionary *schedule1 = [NSMutableDictionary dictionaryWithDictionary:
                                        @{ @"date" : date,
                                           @"team1" : team1,
                                           @"team2" : team2,
                                           }];
      
      [schedule addObject:schedule1];
    
    };
    
    //Add games
    addGameSchedule(@"Feb. 9, Tuesday", @"Spurs", @"Heat");
    addGameSchedule(@"Feb. 10, Wednesday", @"Spurs", @"Magic");
    addGameSchedule(@"Feb. 18, Thursday", @"Spurs", @"Clippers");
    addGameSchedule(@"Feb. 19, Friday", @"Spurs", @"Lakers");
    addGameSchedule(@"Feb. 21, Sunday", @"Spurs", @"Suns");
    
    
//    Old code replaced by blocks
//    
//    NSMutableDictionary *schedule1 = [NSMutableDictionary dictionaryWithDictionary:
//                                      @{ @"date" : @"Feb. 9, Tuesday",
//                                         @"team1" : @"Spurs",
//                                         @"team2" : @"Heat",
//                                         }];
//    
//    [schedule addObject:schedule1];
//    
//    NSMutableDictionary *schedule2 = [NSMutableDictionary dictionaryWithDictionary:
//                                      @{ @"date" : @"Feb. 10, Wednesday",
//                                         @"team1" : @"Spurs",
//                                         @"team2" : @"Magic",
//                                         }];
//    
//    [schedule addObject:schedule2];
//    
//    NSMutableDictionary *schedule3 = [NSMutableDictionary dictionaryWithDictionary:
//                                      @{ @"date" : @"Feb. 18, Thursday",
//                                         @"team1" : @"Spurs",
//                                         @"team2" : @"Clippers",
//                                         }];
//    
//    [schedule addObject:schedule3];
//    
//    NSMutableDictionary *schedule4 = [NSMutableDictionary dictionaryWithDictionary:
//                                      @{ @"date" : @"Feb. 19, Friday",
//                                         @"team1" : @"Spurs",
//                                         @"team2" : @"Lakers",
//                                         }];
//    
//    [schedule addObject:schedule4];
//    
//    NSMutableDictionary *schedule5 = [NSMutableDictionary dictionaryWithDictionary:
//                                      @{ @"date" : @"Feb. 21, Sunday",
//                                         @"team1" : @"Spurs",
//                                         @"team2" : @"Suns",
//                                         }];
//    
//    [schedule addObject:schedule5];
  }
  
  self.playerImage.image = [UIImage imageNamed: [selectedPlayer objectForKey:@"img"]];
  self.playerLabel.text  = [selectedPlayer objectForKey:@"name"];
  self.playerPoints.text = [selectedPlayer objectForKey:@"ppg"];
  
}
- (IBAction)addPlayer:(id)sender {
}
- (IBAction)savePlayer:(id)sender {
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return lineup.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  NSString *cellIdentifier = @"cell";
  
  UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
  
  //Player name
  cell.textLabel.text = [lineup[indexPath.row] objectForKey:@"name"];
  
  //Player position and number
  cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", [lineup[indexPath.row] objectForKey:@"num"], [lineup[indexPath.row] objectForKey:@"pos"]];
  
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  selectedPlayer = lineup[indexPath.row];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
  return schedule.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
  NSString *identifier = @"collectionCell";
  CollectionViewCell_Schedule *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
  
  //Date
  cell.date.text = [schedule[indexPath.row] objectForKey:@"date"];
  
  //Visiting team - left
  cell.team1.text = [schedule[indexPath.row] objectForKey:@"team1"];
  
  //Home team - right
  cell.team2.text = [schedule[indexPath.row] objectForKey:@"team2"];

  //Team logo
  cell.team1ImageView.image = [UIImage imageNamed:[[schedule[indexPath.row] objectForKey:@"team1"] lowercaseString]];
  cell.team2ImageView.image = [UIImage imageNamed:[[schedule[indexPath.row] objectForKey:@"team2"] lowercaseString]];
  
  return cell;
}

@end
