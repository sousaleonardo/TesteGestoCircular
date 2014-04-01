//
//  ViewController.m
//  TesteGestoCircular
//
//  Created by LEONARDO DE SOUSA MENDES on 31/03/14.
//  Copyright (c) 2014 LEONARDO DE SOUSA MENDES. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
@private CGFloat anguloImagem;
@private GestoCircular *gestoCircular;
    
}

-(void)atualizaTexto;
-(void)SetGestoReconizer;

@end

@implementation ViewController

@synthesize imagem,textoSaida;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self->anguloImagem=0;
    
    [self SetGestoReconizer];
    [self atualizaTexto];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)testeGesto{
    NSLog(@"Reconheceu");
}
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]))
    {
        // Custom initialization
        self->anguloImagem = 0;
    }
    return self;
}
*/
//Remove o gesto reconizer antes de girar a tela para não configurar a area do circulo de forma errada
-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    
    [self.view removeGestureRecognizer:gestoCircular];
    
    self->anguloImagem=0;
    imagem.transform = CGAffineTransformIdentity;
}

//Depois do giro da tela configura e adiciona o gesto reconizer
-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    
    [self SetGestoReconizer];
    [self atualizaTexto];
}

-(void)rotacao:(CGFloat)angulo{
    
    self->anguloImagem += angulo;
    
    if (self->anguloImagem > 360) {
        self->anguloImagem -=360;
    }else if(self->anguloImagem < -360) {
        self->anguloImagem +=360;
    }
    
    //faz a rotação da imagem e e atualiza a caixa de texto
    [self->imagem layoutIfNeeded];
    
    self->imagem.transform = CGAffineTransformMakeRotation(self->anguloImagem * M_PI/180);
    
    [self atualizaTexto];
    
    /* self->imagem.image.ro
    
    [UIView animateWithDuration:5.0 animations:^{
        self.heightCon.constant = 200
        [self.view layoutIfNeeded];
    }];
     
     */
}

-(void)anguloFinal:(CGFloat)angulo{
    [self atualizaTexto];
}

-(void)atualizaTexto {
    
    self->textoSaida.text=[NSString stringWithFormat:@"\u03b1 = %.2f",self->anguloImagem];
}

//Configura o gesto Reconizer e adiciona na view
-(void)SetGestoReconizer{
    
    CGPoint pontoMedio = [self->imagem center];
    
    NSLog(@"%f",pontoMedio.x);
    NSLog(@"%f",pontoMedio.y);
    
    [self->imagem layoutIfNeeded];
    
    pontoMedio = [self->imagem center];
    
    [self->imagem setCenter:pontoMedio];
    
    NSLog(@"%f",pontoMedio.x);
    NSLog(@"%f",pontoMedio.y);
    
    CGFloat foraRaio = self->imagem.frame.size.width / 2;
    
    //adiciona o /3 no fora Raio para que ele aceite até no max 1/3 do raio do circ p dentro
    self->gestoCircular=[[GestoCircular alloc]initWithPontoMedio:pontoMedio raioMedio:foraRaio/5 foraRaio:foraRaio target:self];
    
    [self.view addGestureRecognizer:gestoCircular];

}

@end
