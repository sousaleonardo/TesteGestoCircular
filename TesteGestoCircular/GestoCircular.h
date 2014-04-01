//
//  GestoCircular.h
//
//  Created by LEONARDO DE SOUSA MENDES on 31/03/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIGestureRecognizerSubclass.h>

@protocol GestocircularDelegate <NSObject>
@optional
-(void)rotacao: (CGFloat)angulo;
-(void)anguloFinal :(CGFloat)angulo;
@end

@interface GestoCircular : UIGestureRecognizer

{
    CGPoint pontoMedio;
    CGFloat foraRaio;
    CGFloat raioMedio;
    CGFloat anguloAcumulado;
    
    id<GestocircularDelegate> target;
}

-(id) initWithPontoMedio: (CGPoint) _pontoMedio
               raioMedio: (CGFloat) _raioMedio
                foraRaio: (CGFloat) _foraRaio
                  target: (id <GestocircularDelegate>)_target;

@end

