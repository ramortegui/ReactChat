package ReactChat;
use Dancer2;
use Dancer2::Plugin::DBIC;

our $VERSION = '0.1';

get '/' => sub {
    template 'index';
};
post '/' => sub {
    session->write( 'nickname', param('nickname') );
    template 'index';
};
get '/users' => sub {
  my $users = schema->resultset('Session')->search({})->get_column('session_data');
  my @list = ();
  while( my $user = $users->next ){
    push @list, from_json($user)->{nickname};
  }
  to_json( \@list ); 
};

true;
