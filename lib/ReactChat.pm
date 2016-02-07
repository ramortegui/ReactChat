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

get '/messages' => sub {
  return _get_messages();
};

post '/messages' => sub {
  my $message = param('message');
  if( session ){
    schema->resultset('Message')->create({
      nickname => session('nickname'),
      message => $message
    }); 
  }
  return _get_messages();
};

get '/leave' => sub {
  app->destroy_session();
  redirect('/');
};

sub _get_messages {
  my $messages = schema->resultset('Message')->search({},{
    order_by => 'id',
    offset => (schema->resultset('Message')->count - 15)
  });
  my @list = ();
  while( my $message = $messages->next ){
    push @list, { nickname => $message->nickname, message => $message->message };
  }
  to_json( \@list ); 
}
true;
