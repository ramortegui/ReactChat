var Dashboard = React.createClass({
  render: function(){
    return (
      <div>
        <Users interval={this.props.interval}/>
      </div>
    )
  }

});

var Users = React.createClass({
  loadUsersFromServer: function(){
    $.ajax({
      url: '/users',
      dataType: 'json',
      cache: false,
      success: function(data) {
        this.setState({users: data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  getInitialState: function(){
    return { users: [] }
  },
  componentDidMount: function() {
    this.loadUsersFromServer();
    setInterval(this.loadUsersFromServer, this.props.interval );
  },
  render: function(){
    var users = this.state.users.map(function(user){
      return <li>{user}</li>;
    });
    return (
      <div>
      <h1> Users </h1>  
      <ul>
        {users}
      </ul>
      </div>
    )
  }
});


ReactDOM.render(<Dashboard interval={2000}/>, document.getElementById('dashboard'));
