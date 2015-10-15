var Message = React.createClass({
  render: function () {
    return (
      <div>
        <b>{ this.props.message.author } said:</b>
        <p>{ this.props.message.content }</p>

        <p><CommentBox comments={ this.props.message.comments } comment_form={this.props.message.comment_form} /></p>
      </div>
    )
  }
});
