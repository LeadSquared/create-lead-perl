use strict;
use warnings;
use IPC::System::Simple qw(system capture);
use LWP 5.64;
use JSON qw( decode_json ); 

#Create lead
my $accessKey = "<your access key>";
my $secretKey = "<your secret key>";

my $url = 'https://api.leadsquared.com/v2/LeadManagement.svc/Lead.Create?accessKey=' . $accessKey . "&secretKey=" . $secretKey;

my $firstName = "John";
my $email = "john@yopmail.com";

my $json =	'[{"Attribute": "FirstName", "Value": "' . $firstName . '"},{ "Attribute": "EmailAddress", "Value": "' . $email .'" }]';

my $req = HTTP::Request->new( 'POST', $url);
$req->header( 'Content-Type' => 'application/json' );
$req->content( $json );
my $lwp = LWP::UserAgent->new;
my $response = $lwp->request( $req );

die 'Error getting $url' unless $response->is_success;
