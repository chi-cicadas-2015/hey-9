var CommentList = React.createClass({
  render: function () {
    var commentNodes = this.props.comments_data.comments.map(function(comment) {
        return <Comment commenter={ comment.commenter } content={ comment.comment.content } />
    });

    return (
      <div className="comment-list">
        { commentNodes }
        <CommentForm form={ this.state.form } onCommentSubmit={ this.handleCommentSubmit } />
      </div>
    )
  }
});
