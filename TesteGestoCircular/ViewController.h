//
//  ViewController.h
//  TesteGestoCircular
//
//  Created by LEONARDO DE SOUSA MENDES on 31/03/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GestoCircular.h"

@interface ViewController : UIViewController <GestocircularDelegate>

@property (nonatomic,strong)IBOutlet UIImageView *imagem;
@property (nonatomic,strong)IBOutlet UITextField *textoSaida;

@end
