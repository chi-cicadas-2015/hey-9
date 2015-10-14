var Message = React.createClass({
  render: function () {
    return (
      <div>
        <b>{ this.props.author } ({this.props.current_user_id}) said:</b>
        <p> {this.props.content} </p>
      </div>
    )
  }
});
