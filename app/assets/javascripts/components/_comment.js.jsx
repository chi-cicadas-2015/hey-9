var Comment = React.createClass({
  render: function () {
    return (
      <div>
        <p><b>{this.props.commenter}</b> commented: <i>{ this.props.content }</i></p>
      </div>
    )
  }
});
