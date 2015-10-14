var Message = React.createClass({
  render: function () {
    return (
      <div>
        <h4>{ this.props.author }</h4>
        <p> {this.props.content} </p>
      </div>
    )
  }
});
