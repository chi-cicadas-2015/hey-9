var Message = React.createClass({
  render: function () {
    return (
      <div>
        <b> { this.props.author } said:</b>
        <p> { this.props.content } </p>
      </div>
    )
  }
});
