#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

	NSArray *vertices =
	@[
	  @{ @"lat": @(42.9606), @"lng": @(-2.8188) },
	  @{ @"lat": @(42.9586), @"lng": @(-2.8737) },
	  @{ @"lat": @(42.9596), @"lng": @(-2.9239) },
	  @{ @"lat": @(42.9932), @"lng": @(-2.9438) },
	  @{ @"lat": @(43.0133), @"lng": @(-2.9287) },
	  @{ @"lat": @(43.0384), @"lng": @(-2.8984) },
	  @{ @"lat": @(43.056), @"lng": @(-2.9197) },
	  @{ @"lat": @(43.069), @"lng": @(-2.9142) },
	  @{ @"lat": @(43.0906), @"lng": @(-2.9108) },
	  @{ @"lat": @(43.0856), @"lng": @(-2.8916) },
	  @{ @"lat": @(43.071), @"lng": @(-2.8689) },
	  @{ @"lat": @(43.1082), @"lng": @(-2.8284) },
	  @{ @"lat": @(43.1467), @"lng": @(-2.8298) },
	  @{ @"lat": @(43.1407), @"lng": @(-2.8099) },
	  @{ @"lat": @(43.1257), @"lng": @(-2.8133) },
	  @{ @"lat": @(43.1031), @"lng": @(-2.8085) },
	  @{ @"lat": @(43.0936), @"lng": @(-2.7975) },
	  @{ @"lat": @(43.0851), @"lng": @(-2.7639) },
	  @{ @"lat": @(43.0841), @"lng": @(-2.735) },
	  @{ @"lat": @(43.0831), @"lng": @(-2.7034) },
	  @{ @"lat": @(43.0751), @"lng": @(-2.7247) },
	  @{ @"lat": @(43.0555), @"lng": @(-2.7268) },
	  @{ @"lat": @(43.0475), @"lng": @(-2.6973) },
	  @{ @"lat": @(43.0304), @"lng": @(-2.6959) },
	  @{ @"lat": @(43.0163), @"lng": @(-2.711) },
	  @{ @"lat": @(43.0023), @"lng": @(-2.6801) },
	  @{ @"lat": @(42.9912), @"lng": @(-2.6973) },
	  @{ @"lat": @(42.9812), @"lng": @(-2.7158) },
	  @{ @"lat": @(42.9817), @"lng": @(-2.7748) },
	  @{ @"lat": @(42.9666), @"lng": @(-2.7817) },
	  @{ @"lat": @(42.9676), @"lng": @(-2.8078) },
	  @{ @"lat": @(42.9611), @"lng": @(-2.8188) },
	  @{ @"lat": @(42.9581), @"lng": @(-2.8751) },
	  @{ @"lat": @(42.9606), @"lng": @(-2.8188) },
	  @{ @"lat": @(42.9606), @"lng": @(-2.8188) },
	  @{ @"lat": @(42.9606), @"lng": @(-2.8188) },
	  @{ @"lat": @(42.9606), @"lng": @(-2.8188) },
	  @{ @"lat": @(42.9606), @"lng": @(-2.8188) },
	  @{ @"lat": @(42.9606), @"lng": @(-2.8188) }
	  ];

	NSInteger numVertices = [vertices count];
    CLLocationCoordinate2D coordenadas[numVertices];

	int i = 0;
	for(NSDictionary *vertice in vertices) {
		coordenadas[i] = CLLocationCoordinate2DMake([[vertice objectForKey:@"lat"] doubleValue], [[vertice objectForKey:@"lng"] doubleValue]);
		++i;
	}

    MKPolygon *area = [MKPolygon polygonWithCoordinates:coordenadas count:numVertices];
    [self.mapa addOverlay:area];

	CLLocationCoordinate2D centro = CLLocationCoordinate2DMake(43.06286807057148, -2.49114990234375);
	
	MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(centro, 150000, 150000);
	[self.mapa setRegion:viewRegion animated:NO];
}

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay
{
	if ([overlay isKindOfClass:[MKPolygon class]])
	{
		MKPolygonView* aView = [[MKPolygonView alloc] initWithPolygon:(MKPolygon*)overlay];
		aView.fillColor = [[UIColor redColor] colorWithAlphaComponent:0.2];
		aView.strokeColor = [[UIColor redColor] colorWithAlphaComponent:0.8];
		aView.lineWidth = 2;
		return aView;
	}
	return nil;
}

@end
