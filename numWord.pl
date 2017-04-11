use strict;
use warnings;
use DBI;

$|=1; # for making printing to terminal more readable?


sub main{
    # Database access information
    my $host = "localhost";
    my $database = "wp";
    my $user = q/user/;
    my $password = q/secret/;

    # can be modified through first 3 command line arguments
    my $wordToFind = "really";
    my $collumn = "post_content_filtered";
    my $table = "wp_posts";

    my $data_source = "dbi:mysql:database=" . $database . ";host=" . $host . ";port=3306";

    my $count = 0;
    my $number = 0;
    my $temp = "";

    if($ARGV[0]){
        $wordToFind = $ARGV[0];
    }
    if($ARGV[1]){
        $collumn = $ARGV[1];
    }
    if($ARGV[2]){
        $table = $ARGV[2];
    }
    my $dbh = DBI->connect($data_source, $user, $password,
        { RaiseError => 1, AutoCommit => 0 }) or die ( "Couldn't connect to database: " . DBI->errstr );

    my $sth = $dbh->prepare("SELECT $collumn FROM $table");


    $sth->execute();

    while (my @row = $sth->fetchrow_array ) {
        $temp = @row[0];
        $number = () = $temp =~ /$wordToFind/gi;
        $count += $number;
    }
    print "For all rows of '$collumn' in table '$table', Found '$wordToFind' " . $count . " times. \n";

    $dbh->disconnect;
}

main();
